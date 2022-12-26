import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import deployFixture from "./deployFixture";

describe("Artwork initializer tests", () => {
  it("Should not allow re-initializing", async () => {
    const { ArtworkContract } = await loadFixture(deployFixture);

    await expect(ArtworkContract.initialize("ArtworkContract", "ART")).to.be
      .reverted;
  });
});
