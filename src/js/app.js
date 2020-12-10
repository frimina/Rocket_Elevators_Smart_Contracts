// App = {
//   web3Provider: null,
//   contracts: {},

//   init: async function () {
//     // Load pets.
//     $.getJSON('../pets.json', function (data) {
//       var petsRow = $('#petsRow');
//       var petTemplate = $('#petTemplate');

//       for (i = 0; i < data.length; i++) {
//         petTemplate.find('.panel-title').text(data[i].name);
//         petTemplate.find('img').attr('src', data[i].picture);
//         petTemplate.find('.pet-breed').text(data[i].breed);
//         petTemplate.find('.pet-age').text(data[i].age);
//         petTemplate.find('.pet-location').text(data[i].location);
//         petTemplate.find('.btn-adopt').attr('data-id', data[i].id);

//         petsRow.append(petTemplate.html());
//       }
//     });

//     return await App.initWeb3();
//   },

//   initWeb3: async function () {

//     // Modern dapp browsers...
//     if (window.ethereum) {
//       App.web3Provider = window.ethereum;
//       try {
//         // Request account access
//         await window.ethereum.enable();
//       } catch (error) {
//         // User denied account access...
//         console.error("User denied account access")
//       }
//     }
//     // Legacy dapp browsers...
//     else if (window.web3) {
//       App.web3Provider = window.web3.currentProvider;
//     }
//     // If no injected web3 instance is detected, fall back to Ganache
//     else {
//       App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
//     }
//     web3 = new Web3(App.web3Provider);

//     return App.initContract();
//   },

//   initContract: function () {

//     $.getJSON('Adoption.json', function (data) {
//       // Get the necessary contract artifact file and instantiate it with @truffle/contract
//       var AdoptionArtifact = data;
//       App.contracts.Adoption = TruffleContract(AdoptionArtifact);

//       // Set the provider for our contract
//       App.contracts.Adoption.setProvider(App.web3Provider);

//       // Use our contract to retrieve and mark the adopted pets
//       return App.markAdopted();
//     });

//     return App.bindEvents();
//   },

//   bindEvents: function () {
//     $(document).on('click', '.btn-adopt', App.handleAdopt);
//   },

//   markAdopted: function () {
//     var adoptionInstance;

//     App.contracts.Adoption.deployed().then(function (instance) {
//       adoptionInstance = instance;

//       return adoptionInstance.getAdopters.call();
//     }).then(function (adopters) {
//       for (i = 0; i < adopters.length; i++) {
//         if (adopters[i] !== '0x0000000000000000000000000000000000000000') {
//           $('.panel-pet').eq(i).find('button').text('Success').attr('disabled', true);
//         }
//       }
//     }).catch(function (err) {
//       console.log(err.message);
//     });
//   },

//   handleAdopt: function (event) {
//     event.preventDefault();

//     var petId = parseInt($(event.target).data('id'));

//     var adoptionInstance;

//     web3.eth.getAccounts(function (error, accounts) {
//       if (error) {
//         console.log(error);
//       }

//       var account = accounts[0];

//       App.contracts.Adoption.deployed().then(function (instance) {
//         adoptionInstance = instance;

//         // Execute adopt as a transaction by sending account
//         return adoptionInstance.adopt(petId, { from: account });
//       }).then(function (result) {
//         return App.markAdopted();
//       }).catch(function (err) {
//         console.log(err.message);
//       });
//     });
//   }

// };

// $(function () {
//   $(window).load(function () {
//     App.init();
//   });
// });

App = {
    web3Provider: null,
    contracts: {},
  
    init: async function() {
      // Load materials.
      $.getJSON('materials.json', function(data) {
        var materialsRow = $('#materialsRow');
        var materials_template = $('#materials_template');
  
        for (i = 0; i < data.length; i ++) {
          materials_template.find('.steel_panel').text(data[i].steel_panel);
          materials_template.find('.rails').text( data[i].rails);
          materials_template.find('.sensor').text(data[i].sensor);
          materials_template.find('.steel_sheet').text(data[i].steel_sheet);
          materials_template.find('.pulley').text( data[i].pulley);
          materials_template.find('.motor').text(data[i].motor);
          materials_template.find('.steelcable').text(data[i].steelcable);
          materials_template.find('.ledlight').text( data[i].ledlight);
          materials_template.find('.button').text(data[i].button);
          materials_template.find('.screen').text(data[i].screen);
          materials_template.find('.controller').text( data[i].controller);
          materials_template.find('.btn-assemble').attr('data-id', data[i].id);
          materials_template.find('.btn-production').attr('data-id', data[i].id);
  
          materialsRow.append(materials_template.html());
        }
      });
  
      return await App.initWeb3();
    },
  
    initWeb3: async function() {
      // Modern dapp browsers...
        if (window.ethereum) {
          App.web3Provider = window.ethereum;
          try {
            // Request account access
            await window.ethereum.enable();
          } catch (error) {
            // User denied account access...
            console.error("User denied account access")
          }
        }
        // Legacy dapp browsers...
        else if (window.web3) {
          App.web3Provider = window.web3.currentProvider;
        }
        // If no injected web3 instance is detected, fall back to Ganache
        else {
          App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
        }
        web3 = new Web3(App.web3Provider);
  
      return App.initContract();
    },
  
    initContract: function() {
      $.getJSON('Manufacturing.json', function(data) {
        // Get the necessary contract artifact file and instantiate it with @truffle/contract
        var ManufacturingArtifact = data;
        App.contracts.Manufacturing = TruffleContract(ManufacturingArtifact);
      
        // Set the provider for our contract
        App.contracts.Manufacturing.setProvider(App.web3Provider);
      
        // Use our contract to retrieve and mark the adopted pets
        return App.markAssembled();
      });
  
      return App.bindEvents();
    },
  
    bindEvents: function() {
      $(document).on('click', '.btn-assemble', App.handleAssemble);
    },
  
    markAssembled: function() {
      var assemblyInstance;
  
      App.contracts.Manufacturing.deployed().then(function(instance) {
        assemblyInstance = instance;
  
      return assemblyInstance.getProducts.call();
      }).then(function(clients) {
        for (i = 0; i < clients.length; i++) {
          if (clients[i] !== '0x0000000000000000000000000000000000000000') {
            $('.panel-assembly').eq(i).find('button').text('Success').attr('disabled', true);
          }
        }
      }).catch(function(err) {
        console.log(err.message);
      });
    },
  
    handleAssemble: function(event) {
      event.preventDefault();
  
      var materialsID = parseInt($(event.target).data('id'));
  
      var assemblyInstance;
  
      web3.eth.getAccounts(function(error, accounts) {
        if (error) {
          console.log(error);
        }
      
        var account = accounts[0];
      
        App.contracts.Manufacturing.deployed().then(function(instance) {
          assemblyInstance = instance;
      
          // Execute adopt as a transaction by sending account
          return assemblyInstance.getDoors();
        }).then(function(result) {
          return App.markAssembled();
        }).catch(function(err) {
          console.log(err.message);
        });
      });
    }
  
  };
  
  
  
  
  $(function() {
    $(window).load(function() {
      App.init();
    });
  });
