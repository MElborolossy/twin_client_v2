module twin_client_v2

pub fn (mut mb Client) deploy(node_id u32, node_twin_id u32, hash string, payload string) ? {
	/*
		{
			node_id: zos node id
			node_twin_id: the twin id of this node
			hash: deployment challenge hash
			payload: zos payload
		}
	*/
	mut msg := mb.send("twinserver.zos.deploy", '{"node_id": $node_id, "node_twin_id": $node_twin_id, "hash": "$hash", "payload": "$payload"}')?
	response := mb.read(msg)
	println("--------- Deploy ZOS Response ---------")
	println(response)
}