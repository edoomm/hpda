# Detailed description of your OLAP schema (facts, dimensions)
## Facts
The atomic fact I defined for this would be the IP-address, since this attribute is only used for one single user, and it's unique, we cannot group it either.

## Dimensions
As for dimensions, I consider to have
1. Area<br>
    1.1. Country of visitor<br>
        1.1.1. City of visitor 
2. Time<br>
    2.1. Access date
        2.1.1. Time spent on the website
3. Browser's user agent
