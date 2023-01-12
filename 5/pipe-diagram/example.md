# The _pipe diagram_ visualizing the program
Data example:
```csv
4711,"Max Musterman","max.musterman@uni-goettingen.de","['HPDA', 'MODULE2']"
```
Consider the following Python program that processes file.csv using a data-flow programming model
```python
d = dataflow.read("file.csv")
```
Above would read a csv file and turn it into a data-flow object
```python
# Analyse what this could compute based on the definition of the operators below3
flat = d.map(lambda t: (t[0], eval(t[3])))
bd = flat.filter(lambda t: "HPDA" in t[1])
bd.write("out.csv")
```
This would get a `out.csv` file with the following data: `4711, ["HPDA"]`
```python
# Analyse what this could compute based on the definition of the operators
fm = flat.flatmap(lambda t: [[t[0], x] for x in t[1]]) # list comprehension
z = fm.group(lambda t: t[1])
r = z.reduce(lambda tl: len(tl))
print(r)
```
```python
# We can also use functions15 
# Calculate cross-product, exclude identity
def joinFunc(x, y):
    if x != y:
        return [x, y]
    else:
        return None

e = fm.join(fm, joinFunc)
print(e)
```