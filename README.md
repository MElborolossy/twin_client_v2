# twin_client_v2
Client for twin_server_v2 using V Lang based on RMB

# Supported Commands

## Twins
- Create a new twin             --> `create_twin(<IPV6>)`
- Get info of a twin with id    --> `get_twin(<TWIN_ID>)`
- List all twins                --> `list_twins()`
- Delete twin with id           --> `delete_twin(<TWIN_ID>`

## Contracts
- Create a new contract           --> `create_contract(<NODE_ID>, <HASH>, <DATA>, <PUBLIC_IP>)`
- Get info of a contract with id  --> `get_contract(<CONTRACT_ID>)`
- Update contract                 --> `update_contract(<CONTRACT_ID>, <HASH>, <DATA>)`
- Cancel contract                 --> `cancel_contract(<CONTRACT_ID>)`

## ZOS
- Deploy workload --> `deploy(<PAYLOAD>)`
