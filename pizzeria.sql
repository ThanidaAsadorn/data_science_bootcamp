# How many flights did each carrier have in 2013?
flights %>%
  group_by(carrier) %>%
  summarise (n=n())

# What are the total distance of each airline's flight in 2013?
flights %>%
  group_by(carrier) %>%
  summarise(sum_dis = sum(distance)) %>%
  arrange(desc(sum_dis))

# What are the top ten popular depart time?
flights %>%
	select(depart_time = dep_time, flights) %>%
  group_by(depart_time) %>%
	summarise(n = n()) %>%
	arrange(-n) %>%
	head(10)
  
# What are the top three of the origin of flights in 2013?
flights %>%
  select(origin) %>%
  group_by(origin) %>%
  summarise(n=n()) %>%
  head(3)

# What are the top five of the carrier with the most average delayed flight?
flights %>%
  group_by(carrier) %>%
  summarise(avg_arr_delay = sum(arr_delay, na.rm = TRUE) / n())  %>%
  arrange(desc(avg_arr_delay)) %>%
  head (5)
