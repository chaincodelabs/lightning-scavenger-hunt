# Lightning Scavenger Hunt

## Admin Infrastructure
*Students do not need to read this section.*

<details>
    <summary>Setup Lightning Invoices</summary>

The included script [invoice-setup.sh](./signet-setup.py) needs to be run by
the administrator on a publicly reachable signet lightning node to set up 
invoices.

The script requires local installation of LND because it relies on `lncli` to 
create invoices for students to pay. LND should be setup with default 
configuration so that `lncli` does not require additional arguments. 

Usage: `./invoice-setup.sh {number of students}`

The script creates invoices for each students with random amounts, and 
outputs a user id, payment request and payment hash that can be given 
to the students.

</details>
