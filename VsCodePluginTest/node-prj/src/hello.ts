export function hello(name: string): string {
	console.log(`Hello, ${name}`);
	return `Hello, ${name}!`;
}

function main() {
	const args = process.argv[2];
	hello(args);
}

main();
