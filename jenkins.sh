export PATH="/cygdrive/c/Tools/cygwin64/bin/:$PATH"

# Update resource_types variable in terraform file
sed -i "s/RESOURCE_TYPES/${resource_types}/g" genesyscloud_tf_export.tf

# EXPORT
export GENESYSCLOUD_REGION=$aws_region_export
export GENESYSCLOUD_OAUTHCLIENT_ID=$export_oauthclient_id
export GENESYSCLOUD_OAUTHCLIENT_SECRET=$export_oauthclient_secret
"$WORKSPACE"/terraform init -no-color
"$WORKSPACE"/terraform apply -no-color -auto-approve

# IMPORT
export GENESYSCLOUD_REGION=$aws_region_import
export GENESYSCLOUD_OAUTHCLIENT_ID=$import_oauthclient_id
export GENESYSCLOUD_OAUTHCLIENT_SECRET=$import_oauthclient_secret
"$WORKSPACE"/terraform -chdir=genesyscloud_tf_export init -no-color
"$WORKSPACE"/terraform -chdir=genesyscloud_tf_export apply -no-color -auto-approve

# DESTROY (for testing)
#sleep 120
#"$WORKSPACE"/terraform -chdir=genesyscloud_tf_export destroy -auto-approve -no-color

