import twin_client_v2 { init, Contract }

const redis_server = "localhost:6379"

pub fn test_contract(){
	mut twin_dest :=  49
	mut tw := init(redis_server, twin_dest) or {panic(err)}
	// Create new contract
	node_id := u32(2)
	hash := "96e3227c5f19f482b0b2fb21074832a1" // ADD YOUR HASH HERE
	data := ""
	public_ip := u32(1)
	new_contract := tw.create_contract(node_id, hash, data, public_ip) or {panic("Can't create new contract with error: $err")}
	println(new_contract)

	// Get contract
	contract_one := tw.get_contract(1) or {panic(err)}
	println(contract_one)

	// Cancel Contract
	// mb.cancel_contract(new_contract.id)
	
}