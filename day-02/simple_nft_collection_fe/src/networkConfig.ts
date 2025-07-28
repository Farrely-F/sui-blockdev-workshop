import { getFullnodeUrl } from "@mysten/sui/client";
import { createNetworkConfig } from "@mysten/dapp-kit";

const { networkConfig, useNetworkVariable, useNetworkVariables } =
  createNetworkConfig({
    devnet: {
      url: getFullnodeUrl("devnet"),
      variables: {
        // TODO: Update with your deployed contract address
        simpleArtNFT: "0x0",
        collectionId: "0x0",
      },
    },
    testnet: {
      url: getFullnodeUrl("testnet"),
      variables: {
        // replacce with your deployed contract address
        simpleArtNFT:
          "0x6d546408d264bc7a72f8c43ce8a81ec26df6bc7290678c3d88252021cb8e1dc6",
        // replacce with your collection id
        collectionId:
          "0xef8d2e16ad1b90464a8cebcf2b3b0ef2cd336446176a5d3e22a96ed54f635813",
      },
    },
    mainnet: {
      url: getFullnodeUrl("mainnet"),
      variables: {
        // TODO: Update with your deployed contract address
        simpleArtNFT: "0x0",
        collectionId: "0x0",
      },
    },
  });

export { useNetworkVariable, useNetworkVariables, networkConfig };
