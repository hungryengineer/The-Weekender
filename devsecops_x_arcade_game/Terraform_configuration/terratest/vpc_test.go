package test
import (
"github.com/gruntwork-io/terratest/modules/terraform"
"testing"
)
func arcadevpctest(t *testing.T) {
opts := &terraform.Options{
	TerraformDir: "../env/network",
}
terraform.Init(t,opts)
terraform.Apply(t,opts)

}