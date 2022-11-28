# A summation
In SQL we have:
```sql
SELECT groupfield, SUM(fieldA) AS mysum FROM "input.csv" GROUP BY groupfield
```

As MapReduce we could approach this by implementing the following `map` function:
```java
public static class Map extends Mapper<LongWritable, Text, Text, Text> {
    public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
        String fields = value.ToString().split(",");

        context.write(fields[0], field[1]); // SELECT groupfield, fieldA
    }
}
```

And the following `reduce` function:
```java
public static class Reduce extends Reducer<Text, Text, Text, Text> {
    public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
        int sum = 0;

        while (values.hasNext()) {
            sum += value.next().get();
        }

        context.write(key, sum);
    }   
}
```