<div align="center"><h1>Unity NFT Gallery V1</h1></div>
</br>
<div align="center">
  <a href="https://unity.com/"><img src="./READMEContent/StackLogos/Unity.png" width="75" height="75"></a>
  <a href="https://learn.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/"><img src="./READMEContent/StackLogos/CSharp.png" width="75" height="75"></a>
  <a href="https://nethereum.com/"><img src="./READMEContent/StackLogos/Nethereum.png" width="75" height="75"></a>
  <a href="https://docs.soliditylang.org/en/v0.8.17/"><img src="./READMEContent/StackLogos/Solidity.png" width="75" height="75"></a>
  <a href="https://www.openzeppelin.com/"><img src="./READMEContent/StackLogos/OpenZeppelin.png" width="75" height="75"></a>
  <a href="https://hardhat.org/"><img src="./READMEContent/StackLogos/Hardhat.png" width="75" height="75"></a>
  <a href="https://polygon.technology/"><img src="./READMEContent/StackLogos/Polygon.png" width="75" height="75"></a>
  <a href="https://www.typescriptlang.org/"><img src="./READMEContent/StackLogos/Typescript.png" width="75" height="75"></a>
</div>

<br></br>
- This project is a NFT Gallery proof of concept, that allows users to explore a 3D environment to view a series of NFTs, including their images and details
- Adapted from [this tutorial](https://learn.figment.io/tutorials/building-a-3d-art-gallery-using-unity3d-and-nethereum) by [Bhaskar Dutta](https://github.com/BhaskarDutta2209).
- The user can roam around the gallery environment, and view a visual representation of NFTs that are present on the marketplace. When the user stands close to an artwork, details about it are displayed on the screen, including the title, description, if its available for purchase, the seller, and the price.
- The smart contract system for this project involved an [ERC721 standard NFT](https://ethereum.org/en/developers/docs/standards/tokens/erc-721/) that is [enumerable](https://docs.openzeppelin.com/contracts/3.x/api/token/erc721#IERC721Enumerable) and implements [URI storage](https://docs.openzeppelin.com/contracts/4.x/api/token/erc721#ERC721URIStorage), as well as a custom Marketplace contract which allows users to list an NFT and buy it for the listed price. Both contracts are also [upgradeable](https://docs.openzeppelin.com/contracts/4.x/upgradeable). 
- NOTE: This project is a proof of concept, and not intended to represent a polished Web3 application. The contract system used in this application has not been audited, and I take no responsiblity for issues which may arise out of its extended use.

## OpenSea
The NFT collection associated with this contract can be viewed on the [testnet version of OpenSea](https://testnets.opensea.io/collection/unity-nft-gallery-collection)

## Test Coverage
<div align="center"><img src="./READMEContent/TestCoverage/AllTests.PNG" /></div>
<div align="center"><img src="./READMEContent/TestCoverage/Coverage.PNG" /></div>

## Deployments (Polygon Mumbai Polyscan)
- [Artwork](https://mumbai.polygonscan.com/address/0x71327218f2753D67680D3735C9C3D9379E8d1109#code)
- [Marketplace](https://mumbai.polygonscan.com/address/0xAe6c254ab47F360dD9Aeb6cf59de98065Dfb492E#code)

## Screenshots

### Gallery
<div align="center"><img src="./READMEContent/Gallery/IntroRoom.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Shot1.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Shot2.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Shot3.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Shot4.PNG" /></div>

### Artworks
<div align="center"><img src="./READMEContent/Gallery/Artwork1.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Artwork2.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Artwork3.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Artwork4.PNG" /></div>
<div align="center"><img src="./READMEContent/Gallery/Artwork5.PNG" /></div>
