# A join
In SQL we have:
```sql
SELECT a.f1, b.f2 FROM "tbl1.csv" AS a JOIN "tbl2.csv" AS b ON a.id = b.id
```

As MapReduce we could approach this by implementing the following `map` function:
```java
public static class Map extends Mapper<LongWritable, Text, Text, Text> {
    public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
        // String fields = value.ToString().split(",");

        // String fieldB = "something";

        // if (fields[1].Equals(fieldB)) { // Where fieldB
        //     context.write(key, fields[0]); // Select fieldA
        // }
    }
}
```

And the following `reduce` function:
```java
public static class Reduce extends Reducer<Text, Text, Text, Text> {
    public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
        // String fieldA;

        // while (values.hasNext()) {
        //     fieldA = values.next().get();
        //     context.write(key, fieldA);
        // }
    }   
}
```