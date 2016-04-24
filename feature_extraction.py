import pyAudioAnalysis as pyaud
from pyAudioAnalysis import audioBasicIO
from pyAudioAnalysis import audioFeatureExtraction
import numpy as np



class extractFeatures(object):

	def __init__(self,filename):
		'''Open file and get it ready for feature extraction. Fs is the sampling frequecy. x is the numpy
		array storing the no of features and the number of frames of the given song.'''
		[self.Fs, self.x] = audioBasicIO.readAudioFile(filename)
		self.F = audioFeatureExtraction.stFeatureExtraction(self.x, self.Fs, 0.050*self.Fs, 0.025*self.Fs)
	
	def _calculateMeanSet(self):
		self.meanSet = []
		self.expxsq = []
		for i in range(len(self.F)):
			dataArray = self.F[i]
			sum = 0
			sum2 = 0
			noOfElements = len(dataArray)
			for element in dataArray:
				sum = sum + element
				sum2 = sum2 + element**2
			self.meanSet.append(float(sum)/noOfElements)
			self.expxsq.append(float(sum2)/noOfElements)
		return self.meanSet,self.expxsq
	def means(self):
		meanset, expxsq = self._calculateMeanSet()
		varSet = []
		for i in range(len(meanset)):
			element = expxsq[i] - (meanset[i])**2
			varSet.append(element)
		return sum(varSet), sum(meanset)
	




		





