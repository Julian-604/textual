Client                          Server
  |                                |
  |--- Initiate connection ------->|  (Requesting SSH session on port 22)
  |                                |
  |<--- Server sends public key ---|  (For identity verification)
  |                                |
  |--- Verify server key ----------|  (Matches known_hosts file)
  |                                |
  |--- Exchange encryption keys --->|  (Diffie-Hellman or similar algorithm)
  |                                |
  |<--- Encryption keys accepted --|  (Secure channel established)
  |                                |
  |--- Send client authentication ->|  (Password or public key)
  |                                |
  |<--- Authentication successful -|  (Access granted)
  |                                |
  |====== Secure SSH Session ======|  (Encrypted data exchange)
  |                                |
