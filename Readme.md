# vulkan-cloud-test
Vulkan Cloud Testing

## Usage
### If you need to build the docker image
```bash
docker build -t <image name> .
docker push <image name>
```
Then edit values.yaml to change the images to your image name.

### Deploying
This assumes you have `kubectl` and `helm` correctly set up.
```bash
helm install gputest .
```
Then you can see the status:
```bash
kubectl get pods
```