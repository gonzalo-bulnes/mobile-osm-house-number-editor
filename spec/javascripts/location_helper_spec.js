describe("location_helper_spec", function() {
  // Guard runs only one suite when trggered by file modification
  // each spec file should have a wrapper suite

  describe("CloudMade Leaflet", function() {
    it("should be available", function() {
      expect(L).toBeDefined();
    });
  });

  describe("LocationHelper", function() {
    it("should be available", function() {
      expect(LocationHelper).toBeDefined();
    });
    it("should define a default location", function() {
      expect(LocationHelper.default.lat).toBeDefined();
      expect(LocationHelper.default.lng).toBeDefined();
    });
  });
});
