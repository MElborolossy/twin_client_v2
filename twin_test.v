import twin_client_v2 { init, Twin }

const redis_server = "localhost:6379"

pub fn test_twin(){
	mut twin_dest :=  49
	mut tw := init(redis_server, twin_dest) or {panic(err)}
	// Create new twin
	new_twin_ip := "ADD_YOUR_IPV6 ADDRESS HERE"
	new_twin := tw.create_twin(new_twin_ip) or {panic(err)}
	assert new_twin.ip == new_twin_ip

	// Get twin
	twin_49 := tw.get_twin(49) or {panic(err)}
	assert twin_49.account_id == "5D2etsCt37ucdTvybV8PaeQzmoUsNp7RzxZQGJosmY8PUvKQ"

	// List twins
	twins := tw.list_twins() or {panic(err)}
	assert twins != []Twin{}

	// Delete Twin
	tw.delete_twin(new_twin.id)
	
}