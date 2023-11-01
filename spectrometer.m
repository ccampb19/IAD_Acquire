classdef spectrometer
    %SPECTROMETER Parent class for spectrometer driver wrappers
    %   IAD_acquire needs a consistent API to talk to spectrometers, so we 
    %   define that here. Individual spectrometer classes inherit this 
    %   class, and methods are defined in the child.

    properties
        % Mandatory
        NumPixels (1,1) double  % Number of pixels. Often 512,1024,
        WvArray (:,1) double    % All wavelengths captured (for plotting)
        MinIntTime (1,1) double % Minimum integration time in ms
        MaxIntTime (1,1) double = 65535; % Max integration time in ms

        % Optional...
        ModelNo string  % Spectrometer Nomenclature, e.g, "BTC621E-1024"
        Coefs (1,:) double  % Calibration coefficients, if needed
        Driver  % Handle to driver
        Handle  % Handle to spectrometer or other necessities

    end

    methods
        function obj = spectrometer()
            %SPECTROMETER Construct an instance of this class
            %   Detailed explanation goes here
        end

        function [obj,status] = initSpec(obj)
        end

        function [obj,status] = setIntegrationTime(obj)
        end

        function data = acquire(obj)
        end

        function obj = closeSpec(obj)
        end

    end
end