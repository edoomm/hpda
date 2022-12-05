class DataFlow:
    """Simplified data-flow programming model
    """
    def __init__(self, tuple) -> None:
        """Intialization of data-flow object

        Args:
            tuple(list): A list of tuples
        """
        self.tuple = tuple
    
    def __str__(self) -> str:
        return str(self.tuple)

    # Operators

    def read(self, file):
        """Provide the content of a (trivial) CSV file as a list of tuples.
        """

    def write(self, file) -> None:
        """Write the output into the file.
        """

    def filter(self, function):
        """Keep the list of tuples for which function(t) returns true.
        """
        filter_tuple = [] # final tuple

        for e in self.tuple:
            res = function(e)

            if res:
                filter_tuple.append(e)
        
        return DataFlow(filter_tuple)

    def map(self, function):
        """Transform one tuple for each input tuple.
        """
        map_tuple = []

        for e in self.tuple:
            res = function(e)

            map_tuple.append(res)
        
        return map_tuple

    def flatmap(self, function):
        """Transform each input tuple into a list with arbitrary number of tuples.
        """
        flatmap_tuple = []

        for e1 in self.tuple:
            for e2 in e1:
                res = function(e2)
                flatmap_tuple.append(res)
        
        return flatmap_tuple

    def group(self, function):
        """Group together all tuples with the same string (returned by function). 
        The result is a list of tuples containing the list of names and all tuples.

        Args:
            function(lambda): Gets the string, which will be the key in the returned group tuple
        Returns:
            DataFlow: Result of grouping
        """
        group_tuple = [] # Builds the final tuple
        group_dict = {} # Stores the keys and their correspondant index in group_tuple
        i = 0

        for e in self.tuple:
            res = function(e)

            if res not in group_dict:
                group_tuple.append([res, [e]])
                group_dict[res] = i
                i += 1
            else:
                group_tuple[group_dict[res]][1].append(e)
        
        return DataFlow(group_tuple)

    def reduce(self, function):
        """Apply the reduction function to each group (or all data if no groups are used) 
        returning a single tuple. The function is called for each group with the list of 
        elements as a single argument.
        """

    def join(self, y, function):
        """Join any tuple in itself with any tuple from y by calling function (tx,ty) on 
        each pair of tuples.
        """
        join_tuple = []

        for e in self.tuple:
            res = function(e, y)

            join_tuple.append([res, e])
        
        return join_tuple


d = DataFlow([["name1", "1", "2"], ["name2", "3", "4"], ["name1", "5", "6"]])
# r = d.group(lambda x: x[0])
# r = d.filter(lambda x: x[0] == "name1")
# r = d.map(lambda x: x[0]+"m")
# r = d.flatmap(lambda x: x+"m")
# r = d.join(",", lambda x[0], y: x+y)
fn = lambda x, y: x[0] + y
r = d.join(",", fn)
print(r)