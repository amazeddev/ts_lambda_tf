import dayjs from "dayjs";
import {
  Handler,
  Context,
  APIGatewayEvent,
  APIGatewayProxyResult,
} from "aws-lambda";

export const handler: Handler = async (
  event: APIGatewayEvent,
  context: Context
): Promise<APIGatewayProxyResult> => {
  const now = dayjs().format();
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
