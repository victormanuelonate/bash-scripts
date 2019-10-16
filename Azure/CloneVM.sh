#Wrote by Carlos Hernandez @CC

Get-AzureRmVMSize $locationName | Out-GridView


$resourceGroupName = "VMs-Desarrollo"
$virtualNetworkName = "Desarrollo_vNet"
$locationName = "eastus"
$virtualNetwork = Get-AzureRmVirtualNetwork -ResourceGroupName RG-Networking -Name $virtualNetworkName
$networkInterface = New-AzureRmNetworkInterface -ResourceGroupName $resourceGroupName -Name "AZ-SitiosIntranet-des-nic1" -Location $locationName -SubnetId $virtualNetwork.Subnets[0].Id
$vmConfig = New-AzureRmVMConfig -VMName "AZ-SitiosIntranet-des" -VMSize "Standard_DS2_v2"
$vmConfig = Set-AzureRmVMOSDisk -VM $vmConfig -Name "AZ-SitiosIntranet-des" -VhdUri https://almacenamientovmsdmzpre.blob.core.windows.net/vhds/SitiosInternet-clone-so.vhd -DiskSizeInGB 160 -CreateOption Attach -Linux
$vmConfig = Add-AzureRmVMNetworkInterface -VM $vmConfig -Id $networkInterface.Id
$vm = New-AzureRmVM -VM $vmConfig -Location $locationName -ResourceGroupName $resourceGroupName
