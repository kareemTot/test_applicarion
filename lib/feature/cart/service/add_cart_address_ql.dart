const String addAddressQl = ''' 
mutation AddCartAddress(\$firstName : OptionalString , \$lastName : OptionalString , \$city : OptionalString , \$countryName : OptionalString) {
    addCartAddress(
        command: {
            storeId: "alkhbaz"
            userId: "5f5d15fd-39e2-4a8d-93d8-727208148bea"
            address: {
                city: \$city
                countryName: \$countryName
                addressType: 1
                firstName: \$firstName
                lastName: \$lastName
            }
            cartId: "95f60df5-136f-49e6-b0c3-42289c11aacb"
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
        total {
            amount
            decimalDigits
            formattedAmount
            formattedAmountWithoutCurrency
            formattedAmountWithoutPoint
            formattedAmountWithoutPointAndCurrency
        }
        items {
            catalogId
            categoryId
            createdDate
            height
            id
            imageUrl
            isGift
            isReadOnly
            isReccuring
            languageCode
            length
            measureUnit
            name
            note
            objectType
            productId
            productType
            quantity
            requiredShipping
            shipmentMethodCode
            sku
            taxPercentRate
            taxType
            thumbnailImageUrl
            volumetricWeight
            weight
            weightUnit
            width
            fulfillmentCenterId
            fulfillmentCenterName
        }
    }
}
''';
