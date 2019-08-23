

contract GovernanceProxy {
    TreasuryGovernance public governance_contract = TreasuryGovernance(msg.sender);
    address public owner = msg.sender;
    function set_new_governance(address _governance)
    {
        require (msg.sender == owner);
        governance_contract = TreasuryGovernance(_governance);
    }
    
    function submit_new_proposal(string _name, string _url, bytes32 _hash, uint _length_in_epochs, address _destination, uint _funding) public payable
    {
        governance_contract.submit_proposal(_name, _url, _hash, governance_contract.get_current_epoch() + 1, governance_contract.get_current_epoch() + 1 + _length_in_epochs, _destination, _funding);
    }
    
    function hash(string _name) constant returns (bytes32)
    {
        return sha3(_name);
    }
}
