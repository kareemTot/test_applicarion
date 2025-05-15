const String addItemToCartMut = '''
  mutation AddItem(\$id :String! ,\$fulfillmentId :String) {
    addItem(command: {
        productId:\$id 
        quantity: 1
        storeId: "alkhbaz"
        userId:"33c62fb7-7904-4872-ad08-34062f343178"
        cartId:"7cebdb6a-530b-4218-90f1-b6b9515b4807"
        cartName: "DefaultCart"
        cartType: "cart"
        currencyCode: "EGP"
        fulfillmentCenterId:\$fulfillmentId
    }) {
      itemsCount
        items {
            inStockQuantity
            warehouseLocation
            isValid
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
