#ifndef CALLINGWAY
#define CALLINGWAY 
#endif

#ifdef __cplusplus 
#define DLLIMPORT extern "C" __declspec(dllimport)
#else
#define DLLIMPORT
#endif

//(1)Basic function
DLLIMPORT int CALLINGWAY bwtekTestUSB(int nTimingMode, int nPixelNo, int nInputMode, int nChannel, void *pExtraData);
DLLIMPORT int CALLINGWAY bwtekSetTimeUSB( long  lTime,int nChannel);
DLLIMPORT int CALLINGWAY bwtekSetTimeBase0USB(long  lTime, int nChannel);
DLLIMPORT int CALLINGWAY bwtekSetTimingsUSB(long lTriggerExit,int nMuliply,int nChannel);
DLLIMPORT int CALLINGWAY bwtekDataReadUSB(int  nTriggerMode, unsigned short *pArray, int nChannel);
DLLIMPORT int CALLINGWAY bwtekReadResultUSB(int  nTriggerMode, int nAverage, int nTypeSmoothing, int nValueSmoothing, unsigned short *pArray, int nChannel);
DLLIMPORT int CALLINGWAY bwtekDataReadUSB1(int  nSpectrumNo, int  nTriggerMode, unsigned short* pArray, double *pStartTime,double *pEndTime,int nChannel);
DLLIMPORT int CALLINGWAY bwtekCloseUSB(int nChannel);
DLLIMPORT int CALLINGWAY bwtekReadEEPROMUSB(char *str, int nChannel);
DLLIMPORT int CALLINGWAY bwtekGetTimeUSB( long  *lTime,int nChannel);


//(2) Supplementary Functions
DLLIMPORT int CALLINGWAY bwtekSmoothingUSB(  int nTypeSmoothing, int nValueSmoothing, double* pArray, int nNum);
DLLIMPORT int CALLINGWAY bwtekConvertDerivativeDouble(int nSelectMethod, int nPointHalf, int nPolynominalOrder, int nDerivativeOrder, double * pRawArray,double * pResultArray, int nDataNumber);
DLLIMPORT int CALLINGWAY bwtekDifferentiateDouble(int nPointInterval, double * pRawArray,double * pWavelengthArray,double * pResultArray, int nDataNumber);
DLLIMPORT int CALLINGWAY bwtekPolyFit(double *x, double *y, int numPts,double *coefs, int order);
DLLIMPORT int CALLINGWAY bwtekPolyCalc(double *coefs, int order, double x, double *y);
//DLLIMPORT int CALLINGWAY bwtekDataExport(DataExport_Parameter_Struct *pDataExport_Parameter_Struct,DataExport_Parameter_Struct0 *pDataExport_Parameter_Struct0, double * pRawArray,double * pResultArray,int *nResultArrayLen)


//(3) Multi-Purpose TTL Output
DLLIMPORT int CALLINGWAY bwtekSetExtLaser(int nOnOff, int nChannel);
DLLIMPORT int CALLINGWAY bwtekSetExtShutter(int nOnOff, int nChannel);
DLLIMPORT int CALLINGWAY bwtekSetExtSync(int nOnOff, int nChannel);
DLLIMPORT int CALLINGWAY bwtekSetExtPulse(int nOnOff, int nDelay,int nHigh, int nLow, int nPulse,int nInverse,int nChannel );
DLLIMPORT int CALLINGWAY bwtekGatedMode(int nGatedTime, int nChannel);

//(4) AUX Port TTL Output
DLLIMPORT int CALLINGWAY bwtekGetExtStatus(int nChannel );
DLLIMPORT int CALLINGWAY bwtekGetTTLIn(int nNo, int *nValue, int nChannel );
DLLIMPORT int CALLINGWAY bwtekSetTTLOut(int nNo, int nSetValue, int nInverse, int nChannel );
DLLIMPORT int CALLINGWAY bwtekGetAnalogIn(int nNo, int *nValue, double *fValue,int nChannel );


//(5) BTF111 
DLLIMPORT int CALLINGWAY bwtekLEDOn(int nChannel);
DLLIMPORT int CALLINGWAY bwtekLEDOff(int nChannel);
DLLIMPORT int CALLINGWAY bwtekLEDDelay(unsigned nDelay, int nChannel);


//(6) BTF113 
DLLIMPORT int CALLINGWAY bwtekSetPulseNo(int nPulseNo,int nChannel);


//(7) shutter Function
DLLIMPORT int CALLINGWAY bwtekShutterOpen(int nChannel);
DLLIMPORT int CALLINGWAY bwtekShutterClose(int nChannel);


//(8) BTC261 & BTC262 Function
DLLIMPORT int CALLINGWAY bwtekSetABGain(int nAB,int nGain, int nChannel);
DLLIMPORT int CALLINGWAY bwtekSetABOffset(int nAB, int nOffset, int nChannel);
DLLIMPORT int CALLINGWAY bwtekGetABGain(int nAB, int *nGain, int nChannel);
DLLIMPORT int CALLINGWAY bwtekGetABOffset(int nAB, int *nOffset, int nChannel);
DLLIMPORT int CALLINGWAY bwtekSetInGaAsMode(int nMode, int nChannel);
DLLIMPORT int CALLINGWAY bwtekGetInGaAsMode(int *nMode, int nChannel);
//DLLIMPORT int CALLINGWAY bwtekQueryTemperature(int nCommand, int &nRaw, double &fTemp, int nChannel);
DLLIMPORT int CALLINGWAY bwtekAccessDeltaTemp(int nOnOff, double *fNum,int nChannel );
DLLIMPORT int CALLINGWAY bwtekAccessDeltaTemp1(int nOnOff, double *fNum,double *fNum1,int nChannel );

DLLIMPORT int CALLINGWAY bwtekReadValue(int nMode,int *nGetValue,int nChannel);
DLLIMPORT int CALLINGWAY bwtekWriteValue(int nMode,int nSetValue,int nChannel);

//(9) BTC263 Function
DLLIMPORT int CALLINGWAY bwtekSetTimeUnitUSB( int  nTimeUnit,int nChannel);
DLLIMPORT int CALLINGWAY bwtekGetTimeUnitUSB( int  *nTimeUnit,int nChannel);

//(10) BRC131 Function
DLLIMPORT int CALLINGWAY bwtekSetTimeBaseUSB( long lTime,int nChannel);


//DataExport_Parameter_Struct0
//typedef struct DataExport_Parameter_Struct0
//{
//  int nOptionX;
//  int nStartX;
//  int nEndX;
//  int nIncX;
//  int nPixelNumber; 
//}
