from flask import Flask, render_template, request
app = Flask(__name__)
import feature_extraction
import subprocess



@app.route('/')
def index():
	return render_template('index.html')

@app.route('/demo', methods=['GET','POST'])
def demo():
	if request.method == 'POST':
		path = request.form['filename']
		file = path
		fileObj = feature_extraction.extractFeatures(file)
		var_sum, means_sum = fileObj.means()
		strObj = "{},{}".format(means_sum, var_sum)
		with open('testData', 'w') as fl:
			fl.write(strObj)
		val = subprocess.check_output(["octave", "classifyMusic.m"])
		val = float(val[657:])
		if(val>=0.5):
			ans = "Genre: Metal"
		else:
			ans = "Genre: Classical"
		return render_template('demo.html', ans=ans)
	return render_template('demo.html',ans="")

app.run(debug=True)
