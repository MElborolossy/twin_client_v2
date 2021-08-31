module twin_client_v2
import threefoldtech.rmb.client

pub struct Client{
	client.MessageBusClient
}

pub fn new (redis_server string, twin_dist []int) ?Client {
	/*
		Create a new Client isntance
		Inputs:
			- redis_server (string): Redis server and port number ex: 'localhost:6379'
			- twin_dist ([]int): Array of twin ids, Client will use them to perform commands. ex: [49, 17]
		Output:
			- Client: new Client instance
	*/
	return Client{client.new(redis_server, twin_dist) ?}
}