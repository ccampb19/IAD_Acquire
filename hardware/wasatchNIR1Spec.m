classdef wasatchNIR1Spec < spectrometer
    %WASATCHNIR1SPEC spectrometer class for Wasatch NIR-1

    methods
        function obj = wasatchNIR1Spec()
            %WASATCHNIR1SPEC Construct an instance of this class
            %   All relevant info can be collected from spectrometer during
            %   initSpec.

        end

        function [obj,status] = initSpec(obj)
            NET.addAssembly( ...
                'C:\Program Files\Wasatch Photonics\Wasatch.NET\WasatchNET.dll');
            obj.Driver = WasatchNET.Driver.getInstance();
            obj.Driver.openAllSpectrometers();
            obj.Handle = obj.Driver.getSpectrometer(0);

            obj.ModelNo = obj.Handle.model;
            obj.NumPixels = obj.Handle.pixels;
            obj.WvArray = obj.Handle.wavelengths;
            status = 1;
            
        end

        function obj = setIntegrationTime(obj,inttime)
            obj.Handle.integrationTimeMS = inttime;
        end

        function data = acquire(obj)
            data = obj.Handle.getSpectrum();
        end

    end
end