"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.handler = void 0;
const dayjs_1 = __importDefault(require("dayjs"));
const handler = async (event, context) => {
    const now = (0, dayjs_1.default)().format();
    const responseMessage = `Hello World ${now}`;
    return {
        statusCode: 200,
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            message: responseMessage,
        }),
    };
};
exports.handler = handler;
