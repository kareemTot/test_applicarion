const String addAddressQl = ''' 
mutation AddOrUpdateCartShipment (\$cityName :OptionalString , \$countryName : OptionalString ,\$firstName :OptionalString , \$lastName : OptionalString,\$line1 : OptionalString,\$shipmentId : OptionalString) {
    addOrUpdateCartShipment(
        command: {
            storeId: "alkhbaz"
            userId: "33c62fb7-7904-4872-ad08-34062f343178"
            cartId: "7cebdb6a-530b-4218-90f1-b6b9515b4807"
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
                id: \$shipmentId
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
