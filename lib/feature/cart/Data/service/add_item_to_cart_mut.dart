const String addItemToCartMut = '''
  mutation AddItem(\$id :String! ,\$fulfillmentId :String) {
    addItem(command: {
        productId:\$id 
        quantity: 1
        storeId: "alkhbaz"
        userId:"5f5d15fd-39e2-4a8d-93d8-727208148bea"
        cartId:"1364befa-b189-4820-87fa-27378a6ec09d"
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
