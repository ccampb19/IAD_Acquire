classdef wasatchNIR1Spec < spectrometer
    %WASATCHNIR1SPEC spectrometer class for Wasatch NIR-1

    % Properties and method prototypes are listed in spectrometer.m

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
            obj.MinIntTime = int8(1); % Replace with a number (ms) when found
            status = 1;
            
        end

        function obj = setIntegrationTime(obj,inttime)
            obj.Handle.integrationTimeMS = inttime;
        end

        function data = acquire(obj)
            data = obj.Handle.getSpectrum();
        end

        function obj = closeSpec(obj)
            obj.Driver.closeAllSpectrometers()
        end

    end
end