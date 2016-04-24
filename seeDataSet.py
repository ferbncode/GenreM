import feature_extraction
'''This file is for the generation of the dataSet for classification'''
file = 'hh_output.wav'
fileObj = feature_extraction.extractFeatures(file)
var_sum, means_sum = fileObj.means()
print("{},{}".format(means_sum, var_sum))

