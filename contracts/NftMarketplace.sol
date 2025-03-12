function listItem(
        address nftAddress,
        uint256 tokenId,
        uint256 price
    )
        external
        notListed(nftAddress, tokenId, msg.sender)
        isOwner(nftAddress, tokenId, msg.sender)
    {
        if (price <= 0) {
            revert PriceMustBeAboveZero();
        }
        IERC721 nft = IERC721(nftAddress);
        if (nft.getApproved(tokenId) != address(this)) {
            revert NotApprovedForMarketplace();
        }
        s_listings[nftAddress][tokenId] = Listing(price, msg.sender);
        emit ItemListed(msg.sender, nftAddress, tokenId, price);
    }

function cancelListing(address nftAddress, uint256 tokenId){} 

function buyItem(address nftAddress, uint256 tokenId){}

function updateListing(
        address nftAddress,
        uint256 tokenId,
        uint256 newPrice
    ){}
function withdrawProceeds(){} // method caller should be withdrawer

function getListing(address nftAddress, uint256 tokenId){}