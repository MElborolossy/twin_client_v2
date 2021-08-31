module twin_client_v2
import json

pub struct Contract{
	version u32
	contract_id u64
	twin_id u32
	node_id u32
	deploy_mentdata string
	deployment_hash string
	public_ips u32
	state string
	public_ips_list []PublicIP
}

struct PublicIP{
	ip string
	getway string
	contract_id u64
}

pub fn (mut mb Client) create_contract (node_id u32, hash string, data string, public_ip u32) ?Contract {
	/*
		Create new contract
		Input:
			- node_id (u32): zos node id 
			- hash (string): deployment challenge hash 
			- data (string): deployment data
			- public_ip (u32): number of public IPs
		Output:
			- Contract: new Contract instance with all contract info.
	*/
	mut msg := mb.send("twinserver.contracts.create", '{"node_id": $node_id, "hash": $hash, "data": $data, "public_ip": $public_ip}') ?
	response := mb.read(msg)
	println("--------- Create Contract Response ---------")
	println(response)
	return json.decode(Contract, response[0].data)
}

pub fn (mut mb Client) get_contract (id int) ?Contract {
	mut msg := mb.send("twinserver.contracts.get", '{"id": $id}') ?
	response := mb.read(msg)
	println("--------- Get Contract Response ---------")
	println(response)
	return json.decode(Contract, response[0].data)
}

pub fn (mut mb Client) update_contract (id int, hash string, data string) ?Contract {
	mut msg := mb.send("twinserver.contracts.update", '{"id": $id, "hash": $hash, "data": $data}') ?
	response := mb.read(msg)
	println("--------- Update Contract Response ---------")
	println(response)
	return json.decode(Contract, response[0].data)
}

pub fn (mut mb Client) cancel_contract (id int) ? {
	mut msg :=  mb.send("twinserver.contracts.cancel", '{"id": $id}') ?
	response := mb.read(msg)
	println("--------- Get Contract Response ---------")
	println(response)
}