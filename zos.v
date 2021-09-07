module twin_client_v2

pub fn (mut mb Client) deploy(payload string) ?Contract {
	/*
		Deploy zos workload
		Input:
			- payload (string): zos payload + node_id + hash
		Output:
			- Contract: new Contract instance with all contract info.
	*/
	mut msg := mb.send("twinserver.zos.deploy", payload)?
	response := mb.read(msg)
	return json.decode(Contract, response.data)
}
