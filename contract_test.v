import twin_client_v2 { new, Contract }

const redis_server = "localhost:6379"

pub fn test_contract(){
	mut twin_dest :=  [49]
	mut mb := new(redis_server, twin_dest) or {panic(err)}
	// Create new contract

	// Get contract
	contract_one := mb.get_contract(1) or {panic(err)}
	println(contract_one)

	// Cancel Contract
	// mb.cancel_contract(new_contract.id)
	
}