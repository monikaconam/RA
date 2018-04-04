/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ProductSelectorController {
    global ProductSelectorController() {

    }
    @RemoteAction
    global static List<String> getProductFamilies() {
        return null;
    }
    @RemoteAction
    global static ePrize_Zemzu.ProductSelectorController.ProductSearchResult searchProducts(ePrize_Zemzu.ProductSelectorController.ProductSearchConfig config) {
        return null;
    }
global class ProductSearchConfig {
    global String orderBy;
    global String orderByField;
    global String productFamily;
    global List<Id> productIds;
    global String searchString;
    global ProductSearchConfig() {

    }
}
global class ProductSearchProduct {
    global String description;
    global String productCode;
    global String productFamily;
    global Id productId;
    global String productName;
    global ProductSearchProduct(Product2 prod) {

    }
}
global class ProductSearchResult {
    global Integer count {
        get;
    }
    global List<ePrize_Zemzu.ProductSelectorController.ProductSearchProduct> products;
    global Integer totalCount;
    global ProductSearchResult() {

    }
}
global class ProductSelectorException extends Exception {
}
}
