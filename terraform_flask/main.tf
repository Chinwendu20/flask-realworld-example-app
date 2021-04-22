
provider "google"{
	credentials = file("gcp-key-file.json")
	project = "sapient-tracer-310523" 
	region = "us-central1"
	zone = "us-central1-c"

}

