classdef fakespec
    %FAKESPEC A dummy spectrometer class that returns answers
    %   Detailed explanation goes here

    properties
        Handle
    end

    methods
        function obj = fakespec(inputArg1,inputArg2)
            %FAKESPEC Construct an instance of this class
            %   Detailed explanation goes here
            obj.Handle = inputArg1 + inputArg2;
        end

        function err = init(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            err = obj.Handle + inputArg;
        end

        function 
    end
end