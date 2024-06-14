### Build and Run Instructions

1. **Save the Dockerfile and `entrypoint.sh` in the same directory.**
2. **Build the Docker image:**

   ```sh
   docker build -t modpoll-alpine .
   ```

3. **Run a container with the created image:**

   ```sh
   docker run -it --rm --network host modpoll-alpine -h
   ```

### Example Usage

If you have a Modbus TCP device available on the host with IP address `192.168.1.100` and you want to query register 100:

```sh
docker run -it --rm --network host modpoll-alpine -m tcp -a 1 -r 100 -t 4:hex 192.168.1.100
```

This configuration ensures that `CTRL+C` will immediately terminate the container, thanks to `tini` handling the signals correctly.
