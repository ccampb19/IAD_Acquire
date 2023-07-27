classdef bwtekSpec < spectrometer
    %BWTEKSPEC spectrometer class for B&W TEK BTC621E-1024 (very old).

    methods
        function obj = bwtekSpec()
            %BWTEKSPEC Construct an instance of this class
            %   Detailed explanation goes here
                obj.NumPixels = 1024;
                obj.ModelNo = "BTC621E-1024";
                obj.Handle = libpointer('uint16Ptr', ...
                    zeros(obj.NumPixels,1));

                obj.Coefs = [ ...
                    3.20234E+2, 8.47811E-1, -1.03570E-4, 7.79542E-10];

                obj.WvArray = (obj.Coefs(1) + ...
                    obj.Coefs(2).*(0:obj.NumPixels-1) + ...
                    obj.Coefs(3).*(0:obj.NumPixels-1).^2 + ...
                    obj.Coefs(4).*(0:obj.NumPixels-1).^3)';

                    % Calibration coefficients (spectrometer EEPROM) for
                    % reference:
                    % app.Spec.Coefs = struct(...
                    %     'a0',3.20234E+2,'a1',8.47811E-1,'a2',-1.03570E-4, ...
                    %     'a3',7.79542E-10,'b0',-3.67543E+2,'b1',1.11888E+0, ...
                    %     'b2',5.91434E-5,'b3',8.96565E-8);
        end

        function [obj,status] = initSpec(obj)
            if not(libisloaded('bwtekusb'))
                loadlibrary('bwtekusb','lib/bwtekusb.h');
            end
            calllib('bwtekusb','bwtekCloseUSB',0);
            status = calllib('bwtekusb','bwtekTestUSB',6,1024,2,0,[]);
            
        end

        function [obj,status] = setIntegrationTime(~,inttime)
            disp("inttime: " + inttime)
            status = calllib('bwtekusb','bwtekSetTimeUSB',inttime,0);

            if status ~= inttime
                uialert(app.IAD_UIFigure, ...
                    "Warning: Spec returned bad integration time.", ...
                    "Hardware Error")
            end
        end

        function data = acquire(obj)
            calllib('bwtekusb','bwtekDataReadUSB', ...
                0,obj.Handle,0);
            data = double(flipud(obj.Handle.Value));
        end

        function obj = closeSpec(obj)
            obj = calllib('bwtekusb','bwtekCloseUSB',0);
        end

    end
end