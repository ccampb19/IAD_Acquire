classdef fakeSpec < spectrometer
    %FAKESPEC A dummy spectrometer class that returns answers for testing.

    % Properties and method prototypes are listed in spectrometer.m

    methods

        function obj = fakespec()
            %FAKESPEC Construct an instance of this class
            obj.NumPixels = 1024;
            obj.WvArray = zeros(obj.NumPixels,1);
            obj.MinIntTime = 100;
        end

        function [obj,status] = initSpec(obj)
            %INITSPEC Initialize a handle and return status.
            %   Detailed explanation goes here
            obj.Handle.IntegrationTime = [];
            status = 1;
        end

        function [obj,status] = setIntegrationTime(obj,inttime)
            obj.Handle.IntegrationTime = inttime;
            status = 1;
        end

        function data = acquire(obj)
            sz = size(obj.WvArray);
            data = randi(65532, sz(1), sz(2));
        end

        function obj = closeSpec(obj)

        end
    end
end