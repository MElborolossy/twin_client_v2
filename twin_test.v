import twin_client_v2 { new, Twin }

const redis_server = "localhost:6379"

pub fn test_twin(){
	mut twin_dest :=  [49]
	mut mb := new(redis_server, twin_dest) or {panic(err)}
	// Create new twin
	new_twin_ip := "ADD_YOUR_IPV6 ADDRESS HERE"
	new_twin := mb.create_twin(new_twin_ip) or {panic(err)}
	assert new_twin.ip == node_twin_id

	// Get twin
	twin_essam := mb.get_twin(49) or {panic(err)}
	assert twin_essam.account_id == "5D2etsCt37ucdTvybV8PaeQzmoUsNp7RzxZQGJosmY8PUvKQ"

	// List twins
	twins := mb.list_twins() or {panic(err)}
	assert twins != []Twin{}

	// Delete Twin
	mb.delete_twin(new_twin.id)
	
}