const String addAddressQl = ''' 
mutation AddOrUpdateCartShipment (\$cityName :OptionalString , \$countryName : OptionalString ,\$firstName :OptionalString , \$lastName : OptionalString,\$line1 : OptionalString,) {
    addOrUpdateCartShipment(
        command: {
            storeId: "alkhbaz"
            userId: "5f5d15fd-39e2-4a8d-93d8-727208148bea"
            cartId: "95f60df5-136f-49e6-b0c3-42289c11aacb"
            cartType: "cart"
            cartName: "DefaultCart"
            currencyCode: "EGP"
            shipment: {
                deliveryAddress: {
                    countryName: \$countryName
                    city: \$cityName
                    firstName: \$firstName
                    lastName:   \$lastName
                    countryCode: "EG"
                    line1: \$line1
                    regionId: "701"
                    regionName: "اكتوبر"
                    name: "اكتوبر"
                }
                fulfillmentCenterId: "d062133c-c665-473a-ad97-931f10fea351"
                shipmentMethodCode: "ZoneRate"
            }
            cultureName: "en-US"
        }
    ) {
        id
        name
        storeId
        hasPhysicalProducts
        isAnonymous
        customerId
        customerName
        isRecuring
        taxPercentRate
        itemsCount
        itemsQuantity
        isValid
        type
        items {
            inStockQuantity
            warehouseLocation
            isValid
            catalogId
            categoryId
            createdDate
            id
            imageUrl
            isGift
            isReadOnly
            isReccuring
            measureUnit
            name
            objectType
            productId
            productType
            quantity
            requiredShipping
            sku
            taxPercentRate
            taxType
            weightUnit
            fulfillmentCenterId
            fulfillmentCenterName
        }
        shipments {
            id
            shipmentMethodCode
            fulfillmentCenterId
            taxPercentRate
            deliveryAddress {
                id
                key
                city
                countryCode
                countryName
                firstName
                lastName
                line1
                name
                regionId
                regionName
                addressType
            }
        }
    }
}

''';
