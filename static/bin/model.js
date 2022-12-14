var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var $ingredientToAdd = $('#ingredientList');
var $ingredientToRemove = $('#remove-bottle');
// Class to handle adding and removing bottles from cabinet
var Cabinet = /** @class */ (function () {
    function Cabinet() {
        this.URL = this.getURL();
    }
    // Create base URL for requests
    Cabinet.prototype.getURL = function () {
        var pageURL = window.location.href;
        var userId;
        if (pageURL.includes('cabinet')) {
            var index = pageURL.search('/cab') - 1;
            userId = pageURL[index];
        }
        else if (pageURL.includes('ingredients')) {
            var bttnID = $('.add-to-cabinet').attr('id');
            var index = bttnID.search('-');
            userId = bttnID.slice(0, index);
        }
        // if on ingredient page
        return ("/user/".concat(userId, "/cabinet"));
    };
    Cabinet.prototype.addBottle = function (ingredientID) {
        return __awaiter(this, void 0, void 0, function () {
            var data;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        data = {
                            // Add ingredient to cabinet
                            ingredientID: ingredientID
                        };
                        return [4 /*yield*/, axios.post(this.URL, data)];
                    case 1:
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        });
    };
    Cabinet.prototype.removeBottle = function (ingredientID) {
        return __awaiter(this, void 0, void 0, function () {
            var data, deleteURL;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        data = {
                            ingredientID: ingredientID
                        };
                        deleteURL = "".concat(this.URL, "/delete");
                        return [4 /*yield*/, axios.post(deleteURL, data)];
                    case 1:
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        });
    };
    return Cabinet;
}());
// Class to handle adding or removing favorite drinks
var Favorite = /** @class */ (function () {
    function Favorite() {
        this.userID = $('.userId').attr('id');
        this.URL = "/user/".concat(this.userID, "/favorites");
        this.data = {
            drinkId: $('.drinkId').attr('id')
        };
    }
    Favorite.prototype.add = function () {
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: 
                    // Add a drink to favorites
                    return [4 /*yield*/, axios.post(this.URL, this.data)];
                    case 1:
                        // Add a drink to favorites
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        });
    };
    Favorite.prototype.remove = function () {
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: 
                    // Remove a drink from favorites
                    return [4 /*yield*/, axios.post(this.URL, this.data)];
                    case 1:
                        // Remove a drink from favorites
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        });
    };
    return Favorite;
}());
