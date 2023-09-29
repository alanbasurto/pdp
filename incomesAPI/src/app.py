from flask import Flask,jsonify,request
import sys


app = Flask(__name__)
incomes=[
    {
        'description':'bet',
        'amount':400
    }]

@app.route('/incomes', methods = ['GET'])
def getList():
    return jsonify(incomes)

@app.route('/incomes', methods = ['POST'])
def addIncome():
    newIncome=request.get_json(force=True)
    incomes.append(newIncome)
    # print(request.get_json(force=True), file=sys.stderr)
    resp = jsonify("the %s income has been successfully added to the records" %newIncome['description'])
    return resp

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)