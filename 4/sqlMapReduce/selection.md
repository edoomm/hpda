# A simple selection
In SQL we have:
```sql
SELECT fieldA FROM "input.csv" WHERE fieldB == something
```

As MapReduce we could approach this by implementing the following `map` function:
```java
public static class Map extends Mapper<LongWritable, Text, Text, Text> {
    public void map(LongWritable key, Text value, Context context) IOException, InterruptedException {
        String fields = value.ToString().split(",");

        String fieldB = "something";

        if (fields[1].Equals(fieldB)) { // Where fieldB
            context.write(/*TODO: key*/, fields[0]) // Select fieldA
        }
    }
}
```

And the following `reduce` function:
```java
public static class Reduce extends Reducer<Text, Text, Text, Text> {
    public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
        String fieldA;

        while (values.hasNext()) {
            // TODO: connect to the map function and use fieldA
        }
        context.write(key, fieldA)
    }   
}
```