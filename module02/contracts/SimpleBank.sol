// SPDX-License-Identifier: MIT
pragma solidity 0.7.5;

contract SimpleBank {
    /**
     * @dev Mapping to store account balances of the bank clients.
     * @dev To save space we store information on whether account exists in the same mapping.
     *      To achieve that we store `balance value + 1` values in the mapping.
     *      Having that said, balance value `zero` means account doesn't exist,
     *      and account value `one` means an account exists and its balance is zero (empty account).
     * @dev See also `exists()` and `balance()`
     */
    mapping (address => uint256) private balances;

    /**
     * @dev Checks if callee (`msg.sender`) account exists and returns the result
     * @return true if callee account exists, false otherwise
     */
    function exists() public view returns(bool) {
        // account owner is accessible as `msg.sender`

        // zero value in the `balances` mapping means account doesn't exist
        // any other value means it exists
        return balances[msg.sender] != 0;
    }

    /**
     * @dev Returns the balance of the callee (`msg.sender`)
     * @dev Throws if callee account doesn't exist
     * @return callee balance in wei
     */
    function balance() public view returns(uint256) {
        // account owner is accessible as `msg.sender`

        // throw if account doesn't exist
        require(exists(), "account doesn't exist!");

        // since we store `balance value + 1` values in the `balances` mapping,
        // we subtract one before returning
        return balances[msg.sender] - 1;
    }

    /**
     * @dev Opens an account for the transaction sender `msg.sender`
     * @dev An account is opened empty
     * @dev Throws if account already exists
     */
    function open() public {
        // account owner is accessible as `msg.sender`

        // TODO: verify account doesn't exist already

        // TODO: implement function logic
    }

    /**
     * @dev Deposits all the ether attached to the transaction (`msg.value`)
     *      into the transaction sender's account (`msg.sender`)
     * @dev Throws if account doesn't exist
     * @dev Throws if there is no ether attached to the transaction (`msg.value` is zero)
     */
    function deposit() public payable {
        // account owner is accessible as `msg.sender`
        // value of ether attached to transaction is accessible as `msg.value`

        // TODO: verify account exists
        // TODO: verify there is a value attached to the transaction

        // TODO: implement function logic
    }

    /**
     * @dev Transfers all the ether on the transaction sender's account
     *      to the account specified (`to`)
     * @dev Throws if transaction sender's account doesn't exist or if it's empty
     * @dev Throws if account `to` doesn't exist
     * @param to an account where to send ether to
     */
    function transfer(address payable to) public {
        // account owner is accessible as `msg.sender`
        // account to transfer to is accessible as `to`

        // TODO: verify sender account exists and has non-zero balance
        // TODO: verify account `to` exists

        // TODO: implement function logic
    }

    /**
     * @dev Withdraws all the ether on the transaction sender's account (`msg.sender`)
     *
     * @dev Throws if transaction sender's account doesn't exist or if it's empty
     */
    function withdraw() public {
        // account owner is accessible as `msg.sender`

        // TODO: verify account exists and has non-zero balance

        // TODO: implement function logic
    }

    /**
     * @dev Closes an account of the transaction sender (`msg.sender`)
     * @dev An account to be closed must be empty
     * @dev Throws if account doesn't exist
     * @dev Throws if account is not empty
     */
    function close() public {
        // account owner is accessible as `msg.sender`

        // TODO: verify account exists and has zero balance

        // TODO: implement function logic
    }
}
