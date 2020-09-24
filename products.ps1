function Get-JSONfromFile {
    param([String]$File)

    $data = Get-Content $File | ConvertFrom-Json

    return $data
}

function Write-JSONtoFile {
    param([String]$File, [Object]$Data)

    $Data | ConvertTo-Json | Out-File $file
}

function New-StockItem {
    param([String]$Category, [String]$Name, [String]$Price, [Boolean]$Status)

    $itemProperties = @{
        "category" = $Category
        "name" = $Name
        "price" = $Price
        "stocked" = $Status 
    }

    $newItem = New-Object psobject -Property $itemProperties; $newItem

    return $newItem
}

function Get-StockByCategory {
    param([Object]$Data, [String]$Category)

    $stock = @() 

    foreach ($d in $Data) {
        if ($d.category -eq $Category) {
            $stock += $d 
        }
    }

    return $stock
}

function Get-StockByStatus {
    param([Object]$Data, [Boolean]$Status)

    $stock = @()

    foreach ($d in $Data) {
        if ($d.stocked -eq $Status) {
            $stock += $d 
        }
    }

    return $stock 
}

function Get-StockByCategoryAndStatus {
    param([Object]$Data, [String]$Category, [Boolean]$Status)

    $stock = Get-StockByCategory -Data $data -Category $Category
    $stock = Get-StockByStatus -Data $stock -Status $status
     
    return $stock 
}