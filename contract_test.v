import twin_client_v2 { init, Contract }

const redis_server = "localhost:6379"

pub fn test_contract(){
	mut twin_dest :=  49 // ADD TWIN ID.
	mut tw := init(redis_server, twin_dest) or {panic(err)}

	// Create new contract
	node_id := u32(2) // CHOOSE THE NODE ID YOU WANT.
	hash := "96e3227c5f19f482b0b2fb21074832a1" // ADD YOUR HASH HERE.
	data := "" // ADD NEEDED DATA HERE, Let it empty for default.
	public_ip := u32(1)
	println("--------- Create Contract ---------")
	new_contract := tw.create_contract(node_id, hash, data, public_ip) or {panic("Can't create new contract with error: $err")}
	println(new_contract)

	// Get Contract
	println("--------- Get Contract ---------")
	con := tw.get_contract(new_contract.contract_id) or {panic(err)}
	assert con.twin_id == twin_dest
	println(con)
	
	// Upgrade Contract
	mod_contract_id = new_contract.contract_id
	mod_hash := "96e3227c5f19f482b0b2fb21074832a1" // ADD YOUR HASH HERE.
	mod_data := "" // ADD NEEDED DATA HERE, Let it empty for default.
	println("--------- Update Contract ---------")
	mod_con := tw.update_contract(mod_contract_id, mod_hash, mod_data) or {panic(err)}
	println(mod_con)

	// Cancel Contract
	// TAKE CARE, YOUR CONTRACT WILL BE CANCELED HERE
	// COMMENT THIS PART IF YOU DON'T WANT TO CANCEL IT
	println("--------- Cancel Contract ---------")
	canceled_contract_id := tw.cancel_contract(new_contract.contract_id) or {panic(err)}
	assert canceled_contract_id == new_contract.contract_id
	println("contract [$canceled_contract_id] cancelled")
	
}
