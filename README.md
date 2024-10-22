# temporal-clis
This docker file will create an image that can be used to run the temporal command lines. 

It installs the temporal command line executables for both amd64 and arm64.  (Small script called temporal attempts to work out the architecture you are on and will run the appropriate executable.

The image also installs go and downloads the latest tcld command line and builds from source.  (Not tested on other architures but suspect you will need to build the image on the same architecture that you intend to run the image on.

# Usage.
  ------

## Build the image
```
$ git clone https://github.com/DonForbes/temporal-clis.git
$ cd temporal-clis 
$ docker build temporalcli .
```
This will build an image and make it available locally.  You can tag and push the image to central repositories or download the image to transfer it around.

```
➜  temporal-clis git:(main) docker image list | grep -e temporalcli -e REPO
REPOSITORY                            TAG       IMAGE ID       CREATED          SIZE
temporalcli                           latest    afca63d88e69   19 minutes ago   2.1GB
```
From the command line it is then possible to run the temporal and tcld command lines using the image.

```
➜  temporal-clis git:(main) docker run temporalcli bash -c 'TEMPORAL_CLOUD_API_KEY=eyJhb.....<API key generated via the Temporal Cloud UI> tcld namespace list'
{
	"namespaces": [
		"backup.sdvdw",
		"caller.sdvdw",
		"cici-test.sdvdw",
		"dallas-test.sdvdw",
		"default.sdvdw",
		"demo-temporal.sdvdw",
		"donald-demo.sdvdw",
		"donald-nexus.sdvdw",
		"epam-onboard.sdvdw",
		"globalnamespaceuserguide.sdvdw",
		"gtm-reporting-prod.sdvdw",
		"handler.sdvdw",
		"helloworld.sdvdw",
		"helloworld-multi-region.sdvdw",
		"keith-gcp-test.sdvdw",
		"migration-demo.sdvdw",
		"moneytransfer.sdvdw",
		"neil-dahlke-dev.sdvdw",
		"neil-terraform-demo-deeb131f.sdvdw",
		"network-test.sdvdw",
		"onboarding-prestage.sdvdw",
		"payments-dev.sdvdw",
		"replay-2024-demo.sdvdw",
		"rick-ross-dev.sdvdw",
		"rick-ross-mrn.sdvdw",
		"rross-billing.sdvdw",
		"rross-monolith.sdvdw",
		"sa-bench-1.sdvdw",
		"schedules-demo.sdvdw",
		"stevea-mrn-test.sdvdw",
		"steveandroulakis-test-1.sdvdw",
		"stevea-schedule.sdvdw",
		"sullivan-apikey.sdvdw",
		"sullivan-dev.sdvdw",
		"sullivan-gcp.sdvdw",
		"sullivan-handler.sdvdw",
		"sullivan-mrn.sdvdw",
		"sunruntest.sdvdw",
		"temporal-booking.sdvdw",
		"temporal-call-center.sdvdw",
		"temporal-demo-infra.sdvdw",
		"temporal-demo-oms.sdvdw",
		"temporal-jumpstart-dotnet.sdvdw",
		"temporal-jumpstart-java.sdvdw",
		"temporal-sa-terraform-demo-048d3191.sdvdw",
		"temporal-sa-terraform-demo-369a5096.sdvdw",
		"temporal-shop-prod.sdvdw",
		"temporal-trivia.sdvdw",
		"terraform.sdvdw",
		"test-mrn.sdvdw",
		"test-mrn-2.sdvdw",
		"test-mrn-3.sdvdw",
		"test-mrn-4.sdvdw",
		"test-mrn-delete.sdvdw",
		"test-mrn-june10.sdvdw",
		"tk-api-key-test.sdvdw",
		"tk-test-namespace-a.sdvdw"
	],
	"nextPageToken": ""
}
```



